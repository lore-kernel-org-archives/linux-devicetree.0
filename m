From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v6 3/3] drivers: soc: xilinx: Add ZynqMP PM driver
Date: Fri, 1 Feb 2019 12:14:45 +0000
Message-ID: <20190201121445.GD10042@e107155-lin>
References: <1548794301-30483-1-git-send-email-jollys@xilinx.com>
 <1548794301-30483-4-git-send-email-jollys@xilinx.com>
 <20190130101236.GA27201@e107155-lin>
 <BYAPR02MB59926CC0829613B4B52A7D3EB8910@BYAPR02MB5992.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR02MB59926CC0829613B4B52A7D3EB8910@BYAPR02MB5992.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <JOLLYS@xilinx.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, Michal Simek <michals@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Rajan Vaja <RAJANV@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 07:01:05PM +0000, Jolly Shah wrote:
> >
> > NACK, if this is for system suspend/reset ? You can just use exiting
> > sysfs, no need to create Xilinx specific new ones. Moreover you need to
> > use PSCI to make sure higher ELs can do orderly suspend/shutdown.
> >
>
> We have power off suspend mode which is not supported by existing sysfs and
> hence new one is needed. Suspend is handled through PSCI interface only.
>

I see only 2 cases supported SUSPEND_SYSTEM_SHUTDOWN and
SUSPEND_POWER_REQUEST. Both are already support so my NACK still stands.

--
Regards,
Sudeep
