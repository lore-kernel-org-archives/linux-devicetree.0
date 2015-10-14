From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 2/5] gpio/xilinx: enable for MIPS
Date: Wed, 14 Oct 2015 17:57:25 +0200
Message-ID: <561E7B65.3090704@metafoo.de>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1444827117-10939-3-git-send-email-Zubair.Kakakhel@imgtec.com> <20151014151813.GL15287@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20151014151813.GL15287@xsjsorenbubuntu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: ralf@linux-mips.org, robh+dt@kernel.org, linus.walleij@linaro.org, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/14/2015 05:18 PM, S=C3=B6ren Brinkmann wrote:
> On Wed, 2015-10-14 at 01:51PM +0100, Zubair Lutfullah Kakakhel wrote:
>> MIPSfpga uses the axi gpio controller. Enable the driver for MIPS.
>>
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com=
>
>> ---
>>  drivers/gpio/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 8949b3f..58e9afd 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -508,7 +508,7 @@ config GPIO_XGENE_SB
>> =20
>>  config GPIO_XILINX
>>  	tristate "Xilinx GPIO support"
>> -	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86)
>> +	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86 || MI=
PS)
>=20
> Hmm, in general, this driver is hopefully generic enough that it does=
n't
> have any real architecture dependencies. And I suspect, we want to
> enable this driver for ARM64 for ZynqMP soon too. Should we probably
> drop these arch dependencies completely? It seems to become quite a l=
ong list.

I've been thinking about this a while ago. This is certainly not the on=
ly
driver affected by this problem. But the thing is people always complai=
n if
new symbols become visable in Kconfig that don't apply to their platfor=
m.

Maybe we should introduce a HAS_REPROGRAMABLE_LOGIC (or similar) featur=
e
Kconfig symbol and let platforms which have a FPGA select it and let dr=
ivers
for FPGA peripherals depend on it.

- Lars
