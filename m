From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PROPOSAL] ARM/FDT: passing multiple binaries to a kernel
Date: Thu, 5 Sep 2013 08:23:22 -0500
Message-ID: <CAL_JsqKfcudKiTOr-MrHsq6NidG-5t5S0t08ELTSpOuc2LF4RQ@mail.gmail.com>
References: <52260608.2030202@linaro.org>
 <CAL_JsqK9PjpScRO8561PhcyKkxhuL4pgMTCh2-UG_ubybJTcCw@mail.gmail.com>
 <5226F2B3.10606@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <5226F2B3.10606-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/boot-architecture>
List-Post: <mailto:boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Errors-To: boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Sender: boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Andre Przywara <andre.przywara-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "xen-devel-GuqFBffKawuEi8DpZVb4nw@public.gmane.org" <xen-devel-GuqFBffKawuEi8DpZVb4nw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 4, 2013 at 3:43 AM, Andre Przywara
<andre.przywara-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 09/04/2013 12:00 AM, Rob Herring wrote:
>>
>> On Tue, Sep 3, 2013 at 10:53 AM, Andre Przywara

>> But surely there would be some advantage of reuse by using the
>> multi-boot protocol since Xen, grub, and OS tools already support it
>> for x86.
>
>
> Yes, but that is x86 only and multiboot is it's nature quite architecture
> specific. The current(?) multiboot v2 spec has no official ARM support (only
> x86 and MIPS), so this would need to be "invented" first. While this is
> technically easy, ARM software currently has no support for multiboot at
> all: not in u-boot and not in Xen.
> Multiboot support in Xen lives entirely in the x86 directory, and big parts
> of it are even in assembly.

If so, I cannot find the assembly and most of it seems to be moved out
of x86 code now.

Rob
