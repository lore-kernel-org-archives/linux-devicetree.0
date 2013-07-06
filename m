From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 1/3] iio: Add Nuvoton NAU7802 ADC driver
Date: Sat, 06 Jul 2013 11:24:04 +0100
Message-ID: <51D7F044.9040205@kernel.org>
References: <1372094699-3832-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1372094699-3832-2-git-send-email-alexandre.belloni@free-electrons.com>
 <51D53B72.6020309@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51D53B72.6020309-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
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
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: brian-ZKiFAVwZFM2FeswfMrDH8w@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jimwall@q.com, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/04/2013 10:08 AM, Lars-Peter Clausen wrote:
> On 06/24/2013 07:24 PM, Alexandre Belloni wrote:
>> The Nuvoton NAU7802 ADC is a 24-bit 2-channels I2C ADC, with adjustable
>> gain and sampling rates.
>>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> Reviewed-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> 
Applied to the togreg branch of iio.git (with a few little tweaks).

There was some fuzz that required manual fixing because of another driver merge so
please check I didn't foul anything up with this or the other bits below.

There were two trivial missing unlocks on error paths in the read_raw function that
I've fixed up (Coccinelle found these for me - if you can I would always advise
running sparse, coccicheck and ideally smatch before submitting patches).

I fixed up the comments because if there is one thing I hate bothering
with it is delightful patches that just fix this stuff. Much better
to do it now given it took 20 secs ;)

> One remark though. Multiline comments should be like
> 
> /*
>  * foo
>  * bar
>  */
> 
> not
> 
> /* foo
>  * bar
>  */
> 
> But not need to resend the patch just for this
> 
> - Lars
> 
