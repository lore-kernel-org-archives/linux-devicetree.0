From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v2 10/16] of: Add vendor prefix for MIPS Technologies, Inc.
Date: Mon, 22 Sep 2014 12:30:05 -0700
Message-ID: <CAL1qeaEd2L8NUugh27hkGMa1aqaxviupRJnBd2+aru1wq6KKGg@mail.gmail.com>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
	<1409938218-9026-11-git-send-email-abrestic@chromium.org>
	<CAL_JsqKGG3ei9=Od74VSL9Sm_=+vsW4U+WBgXmCEtK3iTDfJ0g@mail.gmail.com>
	<CAL1qeaGgBpkuGyxu_P9BNdHjncLA1pfPc-yE98UBj9Ot1koLrA@mail.gmail.com>
	<1E0E7540-B04F-4E89-91F7-B6FAC3C5D889@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1E0E7540-B04F-4E89-91F7-B6FAC3C5D889@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <robherring2@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Jeffrey Deans <jeffrey.deans@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, Linux-MIPS <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 22, 2014 at 12:01 PM, Kumar Gala <galak@codeaurora.org> wro=
te:
>
> On Sep 22, 2014, at 11:28 AM, Andrew Bresticker <abrestic@chromium.or=
g> wrote:
>
>> On Mon, Sep 22, 2014 at 7:23 AM, Rob Herring <robherring2@gmail.com>=
 wrote:
>>> On Fri, Sep 5, 2014 at 12:30 PM, Andrew Bresticker
>>> <abrestic@chromium.org> wrote:
>>>> Add the vendor prefix "mti" for MIPS Technologies, Inc.
>>>>
>>>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>>>> ---
>>>> New for v2.
>>>> ---
>>>> Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>>> 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt=
 b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>>> index ac7269f..efa5a5b 100644
>>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>>> @@ -86,6 +86,7 @@ microchip     Microchip Technology Inc.
>>>> mosaixtech     Mosaix Technologies, Inc.
>>>> moxa   Moxa
>>>> mpl    MPL AG
>>>> +mti    MIPS Technologies, Inc.
>>>
>>> Why not mips as that is more common and the stock ticker.
>>
>> "mti" is already in use, see
>> Documentation/devicetree/bindings/mips/cpu_irq.txt,
>> arch/mips/mti-sead3/sead3.dts, and arch/mips/ralink/dts/*.dtsi.
>
> Isn=E2=80=99t mips already used as well:

Yes, however it is only used for CPUs, it does not appear in any
binding document, and no code actually matches against it.
