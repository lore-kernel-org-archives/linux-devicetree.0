From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 3/3] mtd: rawnand: stm32_fmc2: add polling mode
Date: Thu, 20 Dec 2018 14:44:37 +0100
Message-ID: <20181220144437.04a9a694@bbrezillon>
References: <1544781488-18723-1-git-send-email-christophe.kerello@st.com>
        <1544781488-18723-4-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544781488-18723-4-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Kerello <christophe.kerello@st.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Fri, 14 Dec 2018 10:58:08 +0100
Christophe Kerello <christophe.kerello@st.com> wrote:

> This patch adds the polling mode, a basic mode that do not need
> any DMA channels. This mode is also useful for debug purpose.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
