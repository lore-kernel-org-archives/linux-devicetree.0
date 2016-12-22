From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCHv2 1/3] dt-bindings: arm: update Armada CP110 system
 controller binding
Date: Wed, 21 Dec 2016 16:14:53 -0800
Message-ID: <20161222001453.GW8288@codeaurora.org>
References: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1482316017-22154-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1482316017-22154-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, Hanna Hawa <hannah@marvell.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 12/21, Thomas Petazzoni wrote:
> It turns out that in the CP110 HW block present in Marvell Armada
> 7K/8K SoCs, gatable clock n=B018 not only controls SD/MMC, but also the
> GOP block. This commit updates the Device Tree binding for this piece
> of hardware accordingly.
> =

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Applied to clk-next

-- =

Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
