From: Anurag Kumar Vulisha <anuragku@xilinx.com>
Subject: RE: [PATCH v3 1/2] phy: zynqmp: Add phy driver for xilinx zynqmp phy
 core
Date: Tue, 11 Sep 2018 08:04:41 +0000
Message-ID: <BN3PR0201MB09937FA5CE658BFD974146CBA7040@BN3PR0201MB0993.namprd02.prod.outlook.com>
References: <1536165747-6405-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1536165747-6405-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <20180910201523.GA4024@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910201523.GA4024@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "kishon@ti.com" <kishon@ti.com>, Michal Simek <michals@xilinx.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "vivek.gautam@codeaurora.org" <vivek.gautam@codeaurora.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Hi Rob,

Thanks a lot for spending your time in reviewing this patch series,=20

>> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
>> ---
>> Changes in v3:
>> 	1. Corrected the Documentation as suggested by Vivek Gautam
>>
>> Changes in v2:
>> 	1. Fixed the compilation error when compiled phy-zynqmp.c as a module
>> 	2. Added CONFIG_PM macro in phy-zynqmp.c driver
>> ---
>>  drivers/phy/Kconfig            |    8 +
>>  drivers/phy/Makefile           |    1 +
>>  drivers/phy/phy-zynqmp.c       | 1581
>++++++++++++++++++++++++++++++++++++++++
>>  include/dt-bindings/phy/phy.h  |    2 +
>
>This goes in patch 2. And patch 2 should come first.
>

Will fix this in the next series of the patch

Thanks,
Anurag Kumar Vulisha

>>  include/linux/phy/phy-zynqmp.h |   52 ++
>>  5 files changed, 1644 insertions(+)
>>  create mode 100644 drivers/phy/phy-zynqmp.c  create mode 100644
>> include/linux/phy/phy-zynqmp.h
