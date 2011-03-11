From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/3] arm/dt: add basic mx51 device tree support
Date: Fri, 11 Mar 2011 11:18:37 +0800
Message-ID: <AANLkTi=3cXtnZA+8JW5+-OjjpJBC4SL26NoAMpnrgWmy@mail.gmail.com>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<20110307141656.GC7189@S2101-09.ap.freescale.net>
	<201103071537.49026.arnd@arndb.de>
	<201103101338.45187.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <201103101338.45187.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Arnd,

On Thu, Mar 10, 2011 at 8:38 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 07 March 2011, Arnd Bergmann wrote:
>> On Monday 07 March 2011, Shawn Guo wrote:
>> > > diff --git a/arch/arm/mach-mx5/Makefile b/arch/arm/mach-mx5/Makefile
>> > > index 0d43be9..540697e 100644
>> > > --- a/arch/arm/mach-mx5/Makefile
>> > > +++ b/arch/arm/mach-mx5/Makefile
>> > > @@ -18,3 +18,4 @@ obj-$(CONFIG_MACH_EUKREA_CPUIMX51SD) +=3D board-cp=
uimx51sd.o
>> > > =A0obj-$(CONFIG_MACH_EUKREA_MBIMXSD51_BASEBOARD) +=3D eukrea_mbimxsd=
-baseboard.o
>> > > =A0obj-$(CONFIG_MACH_MX51_EFIKAMX) +=3D board-mx51_efikamx.o
>> > > =A0obj-$(CONFIG_MACH_MX50_RDP) +=3D board-mx50_rdp.o
>> > > +obj-$(CONFIG_MACH_MX51_DT) +=3D board-dt.o
>> >
>> > If board-dt.c is mx51 specific, would it be sane to name it something
>> > like board-mx51-dt.c? =A0We have mx53 stuff in this folder as well.
>> >
>>
>> Alternatively, it could be done the other way round: rename the identifi=
ers
>> in the file from mx51_ to mx5_, and make sure that they don't contain
>> any mx51 specific settings but always refer to properties in the
>> device tree for the differences.
>
> Hi Jason,
>
> I saw that your V4 still implements neither Shawn's suggestion nor mine.

As you said, I don't want to make thing complex too. I don't want to
have mx51_dt or
mx53_dt as Shawn Suggests and I still don't want to make it change to
mx5 now as you suggest
Since this patch only support mx51 currently. I think it's easy to
make change later once mx53 in-deed
added in DT support, what do you think?


>
> =A0 =A0 =A0 =A0Arnd
>
