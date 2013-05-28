From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] video: simplefb: add mode parsing function
Date: Tue, 28 May 2013 13:57:51 +0900
Message-ID: <CAAVeFuLYe6xuzV4Y_r8GXoPWd8n3fn=jyp06hRTJVE-t1pf9eg@mail.gmail.com>
References: <1369626821-28494-1-git-send-email-acourbot@nvidia.com>
 <51A42ED5.2060104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51A42ED5.2060104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2013 at 1:13 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/26/2013 09:53 PM, Alexandre Courbot wrote:
>> The naming scheme of simplefb's mode is precise enough to allow building
>> the mode structure from it instead of using a static list of modes. This
>> patch introduces a function that does this. In case exotic modes that
>> cannot be represented from their name alone are needed, the static list
>> of modes is still available as a backup.
>>
>> It also changes the order in which colors are declared from MSB first to
>> the more standard LSB first.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes from v1:
>> - amended documentation following Stephen's suggestion
>> - allow parsing of bitfields larger than 9 bits
>> - made it clear that the parsing order of bits is changed with respect
>>   to the original patch
>>
>> Andrew, since this patch introduces a (small) change in the DT bindings,
>> could we try to merge it during the -rc cycle so we don't have to come
>> with a more complex solution in the future?
>
> So, I think we shouldn't change the DT binding at all now. The original
> driver is now merged for 3.10, and I think it's far too late to take
> code that implements new features for 3.10. This means that we couldn't
> merge this patch until 3.11. However, by then, we shouldn't be changing
> the DT binding in incompatible ways. Olof has already published some
> U-Boot binaries that use the current binding, and on IRC indicated he'd
> prefer not to change the binding because of that.
>
> As such, we should either:
>
> a) Just add new entries into the format array that already exists in the
> driver. Given David's response, this might be simplest.
>
> b) Extend the DT binding in a 100% backwards-compatible way, which would
> mean defaulting the bit-order to match the existing 1 format, and adding
> a new Boolean property to indicate that the format string is specified
> in the other order.

a) is definitely simpler, so let's do that and drop this patch. Sorry
about the noise.

Alex.
