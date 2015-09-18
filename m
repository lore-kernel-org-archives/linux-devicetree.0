From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/7] hwrng: st: Provide DT bindings for ST's Random
 Number Generator
Date: Fri, 18 Sep 2015 17:23:41 +0100
Message-ID: <CAF2Aj3gBn=PLB=4NvnZwbdtzkYT6QcPPrk3NCNz1+Cx9ZBWr1w@mail.gmail.com>
References: <1442497557-9271-1-git-send-email-lee.jones@linaro.org>
	<1442497557-9271-5-git-send-email-lee.jones@linaro.org>
	<55FC3A11.6080209@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <55FC3A11.6080209@codeaurora.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>, Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieranbingham@gmail.com>, "kernel@stlinux.com" <kernel@stlinux.com>
List-Id: devicetree@vger.kernel.org

On 18 September 2015 at 17:21, Stephen Boyd <sboyd@codeaurora.org> wrot=
e:
> On 09/17/2015 06:45 AM, Lee Jones wrote:
>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/rng/st,rng.txt | 15 +++++++++++++=
++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rng/st,rng.txt
>>
>> diff --git a/Documentation/devicetree/bindings/rng/st,rng.txt b/Docu=
mentation/devicetree/bindings/rng/st,rng.txt
>> new file mode 100644
>> index 0000000..dbc64e6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rng/st,rng.txt
>> @@ -0,0 +1,15 @@
>> +STMicroelectronics HW Random Number Generator
>> +----------------------------------------------
>> +
>> +Required parameters:
>> +compatible   : Should be "st,rng"
>> +reg          : Base address and size of IP's register map.
>> +clocks               : Phandle to device's clock (See: ../clocks/cl=
ock-bindings.txt)
>> +
>> +Example:
>> +
>> +rng@0xfee80000 {
>
> Drop the 0x part please.

Good spot.  Will fix as a subsequent patch.

--=20
Lee Jones
Linaro ST Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
