From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-udoo: Add Pincfgs for UART4
Date: Mon, 8 Oct 2018 17:51:00 -0300
Message-ID: <CAOMZO5BqL5Tfd0+KmN2DiJdoWLSYWSWyppw8qdrb-G_by_68Tw@mail.gmail.com>
References: <1538663639-3427-1-git-send-email-kueffner.markus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1538663639-3427-1-git-send-email-kueffner.markus@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kueffner.markus@gmail.com
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 4, 2018 at 11:35 AM Markus Kueffner
<kueffner.markus@gmail.com> wrote:
>
> From: Markus Kueffner <kueffner.markus@gmail.com>
>
> Add Pincfgs for UART4 to enable Communication with the onboard SAM3X
>
> Signed-off-by: Markus Kueffner <kueffner.markus@gmail.com>

Looks good as per the schematics:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

> +&uart4 { // iMX6-Arduino internal serial port - ttymxc3

Minor nit: // style comment should be avoided.

Actually the whole comment could de dropped IMHO.
