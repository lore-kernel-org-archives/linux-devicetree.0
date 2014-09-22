From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v2 10/16] of: Add vendor prefix for MIPS Technologies, Inc.
Date: Mon, 22 Sep 2014 09:28:11 -0700
Message-ID: <CAL1qeaGgBpkuGyxu_P9BNdHjncLA1pfPc-yE98UBj9Ot1koLrA@mail.gmail.com>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
        <1409938218-9026-11-git-send-email-abrestic@chromium.org>
        <CAL_JsqKGG3ei9=Od74VSL9Sm_=+vsW4U+WBgXmCEtK3iTDfJ0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAL_JsqKGG3ei9=Od74VSL9Sm_=+vsW4U+WBgXmCEtK3iTDfJ0g@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robherring2@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Jeffrey Deans <jeffrey.deans@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, Linux-MIPS <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 22, 2014 at 7:23 AM, Rob Herring <robherring2@gmail.com> wrote:
> On Fri, Sep 5, 2014 at 12:30 PM, Andrew Bresticker
> <abrestic@chromium.org> wrote:
>> Add the vendor prefix "mti" for MIPS Technologies, Inc.
>>
>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>> ---
>> New for v2.
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index ac7269f..efa5a5b 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -86,6 +86,7 @@ microchip     Microchip Technology Inc.
>>  mosaixtech     Mosaix Technologies, Inc.
>>  moxa   Moxa
>>  mpl    MPL AG
>> +mti    MIPS Technologies, Inc.
>
> Why not mips as that is more common and the stock ticker.

"mti" is already in use, see
Documentation/devicetree/bindings/mips/cpu_irq.txt,
arch/mips/mti-sead3/sead3.dts, and arch/mips/ralink/dts/*.dtsi.
