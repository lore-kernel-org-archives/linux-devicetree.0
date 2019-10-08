From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH net,v2 0/2] Update MT7629 to support PHYLINK API
Date: Tue, 8 Oct 2019 16:02:22 -0700
Message-ID: <20191008160222.0bdb7f47@cakuba.netronome.com>
References: <20191007070844.14212-1-Mark-MC.Lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007070844.14212-1-Mark-MC.Lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MarkLee <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rene van Dorst <opensource@vdorst.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 7 Oct 2019 15:08:42 +0800, MarkLee wrote:
> This patch target to update mt7629 eth driver and dts to support PHYLINK

Thanks for the patches Mark. The description of the set should probably
say that it _fixes_ some issues. Right now it sounds a little bit like
you were adding a new feature. Could you rewrite the cover letter to
give us a better idea what issues this patch set is fixing and why
those issues occur?
