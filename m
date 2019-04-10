From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-nitrogen6_max: Disable LVDS channels
Date: Wed, 10 Apr 2019 09:00:07 -0300
Message-ID: <CAOMZO5Dfyu3AvQ9gD+PXCFE=PG9O1Q+0oRE=rM21nTriJpTzog@mail.gmail.com>
References: <20190408175319.9106-1-robert.foss@collabora.com>
 <CAOMZO5DAvaibi5r9CXzk8qbE7XHiHJHHvi9rcq_BJdx7aRVgoQ@mail.gmail.com>
 <4fd506a1-c961-0569-6d39-283758f363d9@collabora.com>
 <CAAMH-ys-S7miJFCAY9bxrDGTPPT7e7c430-_4+edH8scV_qTwA@mail.gmail.com>
 <550afae6-8dd8-39aa-c7a2-01b27557aa53@collabora.com>
 <CAOMZO5Aj+NKOsa1zXfQqsSzqDJGOcza+1wGjdiEytvjAhsnOVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5Aj+NKOsa1zXfQqsSzqDJGOcza+1wGjdiEytvjAhsnOVQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robert Foss <robert.foss@collabora.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Troy Kisky <troy.kisky@boundarydevices.com>, Gary Bisson <gary.bisson@boundarydevices.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 10, 2019 at 8:55 AM Fabio Estevam <festevam@gmail.com> wrote:

> Please check if this patch fixes the problem on your case:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20190410&id=728e096dd70889c2e80dd4153feee91afb1daf72

Also, just confirmed that this commit reached 5.1-rc3.

Robert, please run 5.1-rc3 (or rc4) and let us know if you still see
the problem.
