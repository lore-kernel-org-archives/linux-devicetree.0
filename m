From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: Cmdline FDT query tool
Date: Thu, 27 May 2010 15:35:15 +1000
Message-ID: <AANLkTinJGSz_1bNK8y3JTwqkseU5dg8oIdvT7ir7Mq6u@mail.gmail.com>
References: <AANLkTilo68Va3EzuWq3SPzv-YpXt-7Ty7Us_Q0Fw_Nmv@mail.gmail.com>
	<AANLkTinlyoA-FqbtWh939l9qoc6QDnKwPzNVnjgHFcVc@mail.gmail.com>
	<20100522001725.GD10564@yookeroo>
	<AANLkTikLBDLhSlbLHRCoymDIvbkdU7OVhFnDTpqMXNHt@mail.gmail.com>
	<20100527051708.GC3603@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100527051708.GC3603@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 27, 2010 at 3:17 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, May 27, 2010 at 11:40:51AM +1000, John Williams wrote:
>> On Sat, May 22, 2010 at 10:17 AM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Tue, May 18, 2010 at 12:20:05PM -0600, Grant Likely wrote:
>> >> On Mon, May 17, 2010 at 8:03 PM, John Williams
>> >> <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org> wrote:
>> >> > Hi Grant,
>> >> >
>> >> > At ELC I mentioned a tool I'd written that basically hacked u-boot's
>> >> > "fdt" command into a commandline util for querying DTBs. =A0You can=
 do
>> >> > stuff like this:
>> >> >
>> >> > $ fdt-tool system.dtp print
>> >> >
>> >> > <dump entire DTB in text format>
>> >> >
>> >> > $ fdt-tool system.dtb list /cpus/cpu@0 xlnx,use-dcache
>> >> > xlnx,use-dcache =3D <0x1>
>> >> >
>> >> > and so on.
>> >>
>> >> Cool. =A0Thanks John.
>> >>
>> >> I agree with David. =A0It would probably be useful to include in the
>> >> libfdt (which U-Boot fdt support makes use of too) source repo. =A0Se=
ems
>> >> like a useful tool.
>> >
>> > Of course, to incorporate it with libfdt, it would need to be BSD
>> > dual-licensed, like the rest of libfdt, and we'd need sign-offs from
>> > all authors to that effect.
>>
>> I have no problem with that, but since I ripped the guts of it
>> directly from u-boot there'll be a conversation to be had there.
>
> Ok. =A0Do you have the means to track down the people with whom this
> conversation needs to happen?

>From the header comments:

 * Gerald Van Baren, Custom IDEAS, vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org
 * Based on code written by:
 *   Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> and
 *   Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

John
-- =

John Williams, PhD, B.Eng, B.IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663
