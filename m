From: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v2 3/4] ARM: imx6sl: add imx6sl iomux-gpr field define
Date: Wed, 4 Sep 2013 22:44:59 -0300
Message-ID: <CAP9ODKqD05+S6HBnbBw-5Hs7NYVHRDJf014stSQ_AVeaYzVV+Q@mail.gmail.com>
References: <1378182385-9205-1-git-send-email-B38611@freescale.com>
 <1378182385-9205-4-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378182385-9205-4-git-send-email-B38611@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fugang Duan <B38611@freescale.com>
Cc: devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 3, 2013 at 1:26 AM, Fugang Duan <B38611@freescale.com> wrote:
> Add imx6sl iomux-gpr register field define in "imx6q-iomuxc-gpr.h" header
> file, which is not fully define all iomux-gpr registers and fields, only
> add fec related macro define.
>
> Signed-off-by: Fugang Duan  <B38611@freescale.com>

The 'q' in the header filename is misleading; wouldn't be better to
have it named imx6-iomuxc-gpr.h than?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
