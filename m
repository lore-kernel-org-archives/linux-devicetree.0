From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
Subject: RE: [PATCH v2 03/10] Documentation/dts: Add bindings for QIXIS FPGA
 controller found on FSL boards
Date: Fri, 4 Sep 2015 20:16:42 +0000
Message-ID: <BY1PR0301MB1303E56B5462BCD0C77C7E4D82570@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
 <1441349872-4560-4-git-send-email-bhupesh.sharma@freescale.com>
 <CADRPPNR11BD4WfXTWoQ28rZCd_BJuhdWu49E6jjpO29CH2s5Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CADRPPNR11BD4WfXTWoQ28rZCd_BJuhdWu49E6jjpO29CH2s5Ow@mail.gmail.com>
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
To: Li Leo <LeoLi@freescale.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Singh Jaiprakash <jaiprakash.singh@freescale.com>, Arnd Bergmann <arnd@arndb.de>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "olof@lixom.net" <olof@lixom.net>, "bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: pku.leo@gmail.com [mailto:pku.leo@gmail.com]
> Sent: Friday, September 04, 2015 10:27 PM
> On Fri, Sep 4, 2015 at 1:57 AM, Bhupesh Sharma
> <bhupesh.sharma@freescale.com> wrote:
> > This patch adds bindings for QIXIS FPGA controller found on FSL boards.
> 
> A general comment: when you are updating the device tree bindings.
> You should cc the devicetree@vger.kernel.org mailing list.
> 
> >
> > Some Freescale boards like LS2080AQDS/LS2080ARDB have an on-board
> > FPGA/CPLD connected to the IFC controller. The bindings specified in
> > this patch cater to those on-board FPGA/CPLD controllers.
> 
> We already have the binding defined in
> Documentation/devicetree/bindings/powerpc/fsl/board.txt.  We probably
> should just move it to a more generic location.

Consolidation of powerpc and ARM bindings is something that needs to be
targeted by a separate patch-series, perhaps in future.

There are a number of duplications that can be looked into, but I don't
think this patchset should depend on that.

Regards,
Bhupesh
