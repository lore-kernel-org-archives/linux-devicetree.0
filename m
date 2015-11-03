From: Stuart Yoder <stuart.yoder@freescale.com>
Subject: RE: [PATCH v4] arm64: dts: Added syscon-reboot node for FSL's LS2085A
 SoC
Date: Tue, 3 Nov 2015 22:26:34 +0000
Message-ID: <CY1PR0301MB0748AB5722A44E0D65F5E29F872B0@CY1PR0301MB0748.namprd03.prod.outlook.com>
References: <1446235498-4093-1-git-send-email-German.Rivera@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1446235498-4093-1-git-send-email-German.Rivera@freescale.com>
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
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Sharma Bhupesh <bhupesh.sharma@freescale.com>, Jose Rivera <German.Rivera@freescale.com>, Li Leo <LeoLi@freescale.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: J. German Rivera [mailto:German.Rivera@freescale.com]
> Sent: Friday, October 30, 2015 3:05 PM
> To: robh+dt@kernel.org; mark.rutland@arm.com; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: Sharma Bhupesh-B45370; Yoder Stuart-B08248; Li Yang-Leo-R58472; Rivera Jose-B46482
> Subject: [PATCH v4] arm64: dts: Added syscon-reboot node for FSL's LS2085A SoC
> 
> Added sys-reboot node to the FSL's LS2085A SoC DT to leverage
> the ARM-generic reboot mechanism for this SoC. This mechanism
> is enabled through CONFIG_POWER_RESET_SYSCON.

German, one thing I noticed with this patch-- with the name change to
ls2080a, we should update the patch subject and commit message
to reflect that.

Thanks,
Stuart
