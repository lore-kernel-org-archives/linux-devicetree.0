From: Guy Shapiro <guy.shapiro@mobi-wize.com>
Subject: Re: [PATCH v7 0/3] nvmem: upstream snvs_lpgpr driver
Date: Sun, 17 Sep 2017 10:35:47 +0300
Message-ID: <6081c4e0-b9f3-7fae-624d-d3515a509b67@mobi-wize.com>
References: <20170620070932.10353-1-o.rempel@pengutronix.de>
 <07198c02-ac87-ec1f-accd-75ad6fd0ac30@pengutronix.de>
 <e0abdef9-91af-8c7b-957c-b55be48ca7b4@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e0abdef9-91af-8c7b-957c-b55be48ca7b4@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Oleksij Rempel <ore@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 26/07/2017 12:01, Srinivas Kandagatla wrote:
>
> On 18/07/17 05:52, Oleksij Rempel wrote:
>> Hallo all,
>>
>> Here Gentle Ping to the Old King ;)
>>
>> DT is already ACKed.
>
> Thanks for patience, As this is a new driver it will be queued for 4.14 j=
ust before 4.13-rc5 is released.
>
> thanks,
> srini =

Looks like this patchset is not included in 4.14-rc1.
Is it still on someone's queue?
>>
>> On 20.06.2017 09:09, Oleksij Rempel wrote:
>>> changes v7:
>>> =A0- split imx6ul patch and squash it with with main patches.
>>> =A0- spell fixes in the binding documentation
>>> =A0- return regmap_bulk_read directly.
>>>
>>> changes v6:
>>> =A0- check if device is writable by reading GPR_SL and GPR_HL bits
>>> =A0- use regmap_bulk_* functions instead of while() { regmap_read/write=
 }
>>> =A0- add patch for imx6ul
>>>
>>> changes v5:
>>> =A0- use dcfg->offset instead of priv->offset.
>>>
>>> changes v4:
>>> =A0- change dependencies in Kconfig
>>> =A0- remove unused includes and order them alphabetically
>>> =A0- set MODULE_LICENSE =3D GPL v2
>>> =A0- remove unused int err variable
>>>
>>> changes v3:
>>> =A0- remove regmap and offset properties.
>>>
>>> changes v2:
>>> =A0- correct typos: Registe, parrent...
>>>
>>> Oleksij Rempel (3):
>>> =A0 nvmem: dt: document SNVS LPGPR binding
>>> =A0 nvmem: add snvs_lpgpr driver
>>> =A0 ARM: dts: imx6qdl.dtsi/imx6ul.dtsi: add "fsl,imx6q-snvs-lpgpr" node
>>>
>>> =A0.../devicetree/bindings/nvmem/snvs-lpgpr.txt=A0=A0=A0=A0=A0=A0 |=A0 =
20 +++
>>> =A0arch/arm/boot/dts/imx6qdl.dtsi=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 4 +
>>> =A0arch/arm/boot/dts/imx6ul.dtsi=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 4 +
>>> =A0drivers/nvmem/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 10 ++
>>> =A0drivers/nvmem/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 2 +
>>> =A0drivers/nvmem/snvs_lpgpr.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 155 +++++++++++++++++++++
>>> =A06 files changed, 195 insertions(+)
>>> =A0create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgp=
r.txt
>>> =A0create mode 100644 drivers/nvmem/snvs_lpgpr.c
>>>
