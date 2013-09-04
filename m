From: Andre Przywara <andre.przywara-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PROPOSAL] ARM/FDT: passing multiple binaries to a kernel
Date: Wed, 04 Sep 2013 11:14:08 +0200
Message-ID: <5226F9E0.9070307@linaro.org>
References: <52260608.2030202@linaro.org>
 <CAL_JsqK9PjpScRO8561PhcyKkxhuL4pgMTCh2-UG_ubybJTcCw@mail.gmail.com>
 <5226F2B3.10606@linaro.org>
 <1378284955.17510.64.camel@kazak.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1378284955.17510.64.camel-ommiHX4a84BXesXXhkcM7miJhflN2719@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/boot-architecture>
List-Post: <mailto:boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Errors-To: boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Sender: boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "xen-devel-GuqFBffKawuEi8DpZVb4nw@public.gmane.org" <xen-devel-GuqFBffKawuEi8DpZVb4nw@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/04/2013 10:55 AM, Ian Campbell wrote:
> On Wed, 2013-09-04 at 10:43 +0200, Andre Przywara wrote:
>
>> I am about to write up a more elaborate technical rationale describing
>> the problems with multiboot on ARM:
>>
>> https://wiki.linaro.org/AndrePrzywara/Multiboot
>
> Doesn't seem to exist? A search for "mulitboot" doesn't seem to throw up
> the one you meant either.

Try again now. As mentioned "I am about to write ..." ;-)

Thanks,
Andre.

>>> So, is having a more generic solution really needed?
>>
>> Not necessarily needed, but useful, I think. As described above I don't
>> see any technical obstacles of doing it in a more generic way, so we
>> could as well go ahead with this. On x86 from time to time the need for
>> additional binaries pops up (early microcode loading, for instance), so
>> why not be be prepared.
>
> I agree. There have also been occasions where people doing
> disaggregation have wanted to start multiple initial domains, requiring
> additional modules at load time. I don't think being generic and
> extensible is costing too much here.
>
> Ian.
>
