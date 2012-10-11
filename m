From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/8] dt: add helper inline for retrieving timeout-sec
 property
Date: Thu, 11 Oct 2012 13:55:47 +0200
Message-ID: <CAHkwnC9B7e-3bqar5ePmXQ9eNUnEAsnf+8mdjSKDshAHVQet6g@mail.gmail.com>
References: <1349784251-28261-1-git-send-email-fabio.porcedda@gmail.com>
 <1349784251-28261-2-git-send-email-fabio.porcedda@gmail.com>
 <5075865C.3010606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5075865C.3010606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2012 at 4:29 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 10/09/2012 07:04 AM, Fabio Porcedda wrote:
>> The first user of this function is the watchdog framework.
>
> Who is the 2nd user because I don't see any others. I don't see this
> being a widely used property.

Hi Rob, thanks for reviewing.

There is only one use of this function in my patchset.
I added this function after Jean-Christophe repeatedly suggested to add it.

On Fri, Oct 5, 2012 at 1:16 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> why I bother to comment
> *make this of generic* this is not watchdog specific other driver can use it

Maybe the idea was to have the helper ready when the dt support it's
added to a drivers that use a "timeout" parameter.

If it's for better i can just get rid of this function.
I don't mind.

Best regards

>
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  include/linux/of.h | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 72843b7..5870818 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -470,4 +470,15 @@ static inline int of_property_read_u32(const struct device_node *np,
>>       return of_property_read_u32_array(np, propname, out_value, 1);
>>  }
>>
>> +/**
>> + * of_get_timeout_sec() - Helper to read the timeout_sec property
>> + * @np:              device node from which the property value is to be read.
>> + * @timeout: adress of the output value
>> + */
>> +static inline int of_get_timeout_sec(const struct device_node *np,
>> +                                  u32 *timeout)
>> +{
>> +     return of_property_read_u32(np, "timeout-sec", timeout);
>> +}
>> +
>>  #endif /* _LINUX_OF_H */
>>
>

-- 
Fabio Porcedda
