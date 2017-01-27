From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 1/2] nvmem: sunxi-sid: add support for
 H3 and A64's SID controller
Date: Fri, 27 Jan 2017 19:46:12 +1100
Message-ID: <CAGRGNgUNqBjz+p0Km8oqpkC_zYJ4z9zrQeXnx5y0UaqKuH7nvA@mail.gmail.com>
References: <20170126113345.33686-1-icenowy@aosc.xyz> <20170127081712.x2hprtpo2aolungc@lukather>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBB2MRVTCAKGQEJXLTZOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170127081712.x2hprtpo2aolungc@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Fri, Jan 27, 2017 at 7:17 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Thu, Jan 26, 2017 at 07:33:44PM +0800, Icenowy Zheng wrote:
>> H3 and A64 SoCs have a bigger SID controller, which has its direct read
>> address at 0x200 position in the SID block, not 0x0.
>>
>> Also, H3 SID controller has some silicon bug that makes the direct read
>> value wrong at first, add code to workaround the bug. (This bug has
>> already been fixed on A64 and later SoCs)
>>
>> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> ---
>>  .../bindings/nvmem/allwinner,sunxi-sid.txt         |  22 +++-
>>  drivers/nvmem/sunxi_sid.c                          | 112 +++++++++++++++++++--
>>  2 files changed, 123 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
>> index 1567ccca8de3..2e327a66a938 100644
>> --- a/drivers/nvmem/sunxi_sid.c
>> +++ b/drivers/nvmem/sunxi_sid.c
>> @@ -20,10 +20,28 @@
>>  #include <linux/module.h>
>>  #include <linux/nvmem-provider.h>
>>  #include <linux/of.h>
>> +#include <linux/of_device.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/slab.h>
>>  #include <linux/random.h>
>>
>> +/* Registers and special values for doing register-based SID readout on H3 */
>> +#define SUN8I_SID_PRCTL              0x40
>> +#define SUN8I_SID_RDKEY              0x60
>> +
>> +#define SUN8I_SID_OP_LOCK    0xAC
>> +#define SUN8I_SID_OFFSET_MASK        0x1FF
>> +#define SUN8I_SID_OFFSET_SHIFT       16
>> +#define SUN8I_SID_LOCK_SHIFT 8
>> +#define SUN8I_SID_READ               BIT(1)
>> +
>> +/*
>> + * For newer SoCs with a larger eFUSE, the bytes beyond the first 16 bytes are
>> + * sparse, which makes it not suitable for adding randomness; legacy SoCs' SID
>> + * have only 16 bytes, so we choose to use at most 16 bytes to add randomness.
>> + */
>> +#define SUNXI_SID_MAX_RANDOMNESS_SIZE        16
>> +
>>  static struct nvmem_config econfig = {
>>       .name = "sunxi-sid",
>>       .read_only = true,
>> @@ -91,16 +167,17 @@ static int sunxi_sid_probe(struct platform_device *pdev)
>>       if (IS_ERR(nvmem))
>>               return PTR_ERR(nvmem);
>>
>> -     randomness = kzalloc(sizeof(u8) * (size), GFP_KERNEL);
>> +     randomness_size = max(size, SUNXI_SID_MAX_RANDOMNESS_SIZE);
>> +     randomness = kzalloc(sizeof(u8) * (randomness_size), GFP_KERNEL);
>
> Why is that change needed?

According to the definition of SUNXI_SID_MAX_RANDOMNESS_SIZE, only the
first 16 bytes of the SID data region are sufficiently non-zero to be
used for randomness.

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
