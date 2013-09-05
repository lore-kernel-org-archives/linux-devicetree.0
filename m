From: Duan Fugang-B38611 <B38611@freescale.com>
Subject: RE: [PATCH v2 3/4] ARM: imx6sl: add imx6sl iomux-gpr field define
Date: Thu, 5 Sep 2013 02:01:38 +0000
Message-ID: <9848F2DB572E5649BA045B288BE08FBE01689ED6@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1378182385-9205-1-git-send-email-B38611@freescale.com>
 <1378182385-9205-4-git-send-email-B38611@freescale.com>
 <CAP9ODKqD05+S6HBnbBw-5Hs7NYVHRDJf014stSQ_AVeaYzVV+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAP9ODKqD05+S6HBnbBw-5Hs7NYVHRDJf014stSQ_AVeaYzVV+Q@mail.gmail.com>
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
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio Salvador
Data: Thursday, September 05, 2013 9:45 AM

> To: Duan Fugang-B38611
> Cc: Shawn Guo; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v2 3/4] ARM: imx6sl: add imx6sl iomux-gpr field define
> 
> On Tue, Sep 3, 2013 at 1:26 AM, Fugang Duan <B38611@freescale.com> wrote:
> > Add imx6sl iomux-gpr register field define in "imx6q-iomuxc-gpr.h"
> > header file, which is not fully define all iomux-gpr registers and
> > fields, only add fec related macro define.
> >
> > Signed-off-by: Fugang Duan  <B38611@freescale.com>
> 
> The 'q' in the header filename is misleading; wouldn't be better to have
> it named imx6-iomuxc-gpr.h than?
> 
Yes, since there have many same macro define and register define, we put the iomux-gpr header file
To one. I will submit one patch to rename the header file to imx6-iomuxc-gpr.h.

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
