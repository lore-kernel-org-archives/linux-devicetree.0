From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Mon, 19 Sep 2011 09:34:35 +0200
Message-ID: <CACRpkdbLtTX2hf=_OZwwCje1=LUvXrQEo=Gu2y0YEy6fgi=dgQ@mail.gmail.com>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
	<20110913184207.GA20440@huya.qualcomm.com>
	<CACRpkdbvq2A_eJgCgq5JWgO-VDBd25D0qhrVTf9isnDxZ2k+4g@mail.gmail.com>
	<20110918151755.GA1426@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110918151755.GA1426-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 18, 2011 at 5:17 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On Sun, Sep 18, 2011 at 12:34:20PM +0200, Linus Walleij wrote:
>> On Tue, Sep 13, 2011 at 8:42 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wro=
te:
>> > On Tue, Sep 06, 2011 at 01:52:43PM -0400, Nicolas Pitre wrote:
>> >
>> >> My latest patchset is here:
>> >>
>> >> =A0 git://git.linaro.org/people/nico/linux zImage_DTB_append
>> >>
>> >> I'm not fully satisfied to send them upstream yet though.
>> >
>> > These patches do appear to still work on MSM.
>>
>> Hm I wonder what is wrong on our end, probably our own fault :-/
>>
>> Arey you encapsulating the zImage+DTB in a uImage like I do
>> (so as to use with elder U-Boot) or are you using some other
>> method to get the zImage+DTB into the system?
>
> Our targets use littlekernel (an Android bootloader), so the
> zImage+DTB is combined with an initrd using mkbootimage.
>
> The first time I tried the append patches (not this version), I did
> end up having to use JTAG to debug it, and even then the problem was
> confusing, since a bug was causing it to move all of the code around
> in memory, but some was still cached.
>
> Are you getting far enough to print messages with DEBUG_LL?

Nope :-(

So it'll be JTAG if I should get further with this.

Linus Walleij
