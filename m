From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: Device tree bindings for linux ramoops use
Date: Fri, 6 Jan 2012 08:33:25 -0800
Message-ID: <CAOesGMi3Wc3Bdx5UdXHUxXxv-pMSAhS6VagHaAm6OpA_GFrjAg@mail.gmail.com>
References: <CAOesGMiKBQM61DkLFoTcvMFWV2UCgomLQYDX65_Tkmtoy_hGCg@mail.gmail.com>
 <4F06F662.2020803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F06F662.2020803-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marco Stornelli <marco.stornelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jan 6, 2012 at 5:25 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 01/05/2012 10:39 PM, Olof Johansson wrote:
>> Hi,
>>
>> I'm considering how to best describe the data that ramoops needs in
>> the device tree.
>>
>> The idea is really about describing a memory area that is (likely to
>> be) nonvolatile across reboots. Said area is not to be included in the
>> regular memory map of the system (i.e. not covered by /memory).
>>
>> I have a few options on where to do it. It's not really a hardware
>> device per se, so it's a gray area for the device tree alltogether.
>>
>> How about something like?
>>
>> compatible = "linux,ramoops"
>> linux,ramoops-start = <start address of preserved ram>
>> linux,ramoops-size = ...
>> linux,ramoops-record-size = ...
>> linux,ramoops-include-oopses = ... (this one is a bit of a corner
>> case, it's truly a software setting -- probably leave it out)
>>
>> Anybody have a better idea?
>
> Since all those settings are already settable on the kernel command as
> module parameters, can't you use that? Perhaps we need the bootloader to
> append cmd line options rather than replace as I think u-boot does.

I'm not so sure that's a good idea. The command line will snowball
into a 2KB string pretty quickly if we start doing that. It's already
crazy long on our systems here.


> There is a need for a (typically) on-chip RAM binding which then gets
> carved up into multiple uses. These could be properties of the RAM binding.

Sounds like describing it in a separate memory node is a good start,
and then possibly partitions underneath there.

So, even for the case of nonvolatile-memory, it could be done with a
device node in parallel with the memory nodes on the system, and then
possibly the ramoops node underneath of there. For iram, similarly the
main iram range is covered by the iram device node, and if you need to
partition it further, do it with subnodes similar to how mtd bindings
work. Sounds reasonable, no?


-Olof
