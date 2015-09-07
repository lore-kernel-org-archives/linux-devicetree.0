From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Mon, 7 Sep 2015 11:30:11 +0100
Message-ID: <55ED6733.7050807@linaro.org>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <5E0DCAA5-DB90-4682-92F2-061A07FE973E@bsdimp.com>
 <CAL_Jsq+bw1TcXt0c8L4BSvwWK82L2cG-qdw369EkvxWe-5RXbQ@mail.gmail.com>
 <201509051125.43527.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201509051125.43527.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/09/15 10:25, Arnd Bergmann wrote:
> On Friday 04 September 2015, Rob Herring wrote:
>> On Fri, Sep 4, 2015 at 9:27 AM, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org> wrote:
>>>> On Sep 4, 2015, at 4:21 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote=
:
>>>>>>>> We could do it by parsing the node name e.g. fdma0-audio, or b=
y adding
>>> FreeBSD would generally put these things in /boot/firmware and
>>> it has a generalized mechanism to load the firmware at run time
>>> that=E2=80=99s based on this. While the path names are flexible, ha=
ving
>>> the firmware live in a central place is useful from an automation
>>> point of view. Having just a name, and not a full path, enables
>>> this policy, while still allowing others to have other policies.
>>>
>>> Linux distributions would be free to do whatever they wanted
>>> and implement other policies than FreeBSD.
>>>
>>> So a property like this, with the semantics discussed, seems to
>>> meet the OS independent test.
>>
>> Good. I'll await a binding to review...
>>
>> I would suggest "firmware-names" to be consistent with other naming
>> convention and because their can be more than one (either at the sam=
e
>> time or as fallback). It also leaves "firmware" available if we want
>> to have phandle's to firmware embedded in the DT at some point later=
=2E
>
> Having list of strings would certainly make this more flexible than
> just a single string, for the same reason as taking the list of
> compatible values as the base, so +1 for "firmware-names" over "firmw=
are".

I was recently thinking about how DT filenames would interact with=20
incompatible ABI changes to the firmware's register and/or wire protoco=
l.

Just for example we start with f/ware ABI A and we create a mainline=20
kernel X that supported it.

Vendor now releases a new firmware with ABI B and we update the mainlin=
e=20
driver to support ABI A (to avoid breaking old userspaces) and B,=20
eventually releasing kernel Y.

The question now is how kernels X and Y should use the DT to generate=20
the filename. It is very desirable that kernels X and Y use *different*=
=20
filenames because otherwise a single userspace could not support the ne=
w=20
feature *and* boot with both X and Y.

Having lists of firmwares can certainly help solve this (providing the=20
list can be used to allow a driver to select for an ABI is supports).=20
However I afraid I find this example argues against having filenames in=
=20
DT at all because it seems odd to me that, for kernel and userspace to=20
adopt ABI B that must wait until the DT is updated to include support=20
for ABI B. The hardware didn't change...


Daniel.
