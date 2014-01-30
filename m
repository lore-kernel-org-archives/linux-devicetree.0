From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] ARM: STi: add stid127 soc support
Date: Thu, 30 Jan 2014 19:35:16 +0100
Message-ID: <201401301935.16463.arnd@arndb.de>
References: <1391093744-19905-1-git-send-email-patrice.chotard@st.com>
 <1391093744-19905-2-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1391093744-19905-2-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Stuart Menefy <stuart.menefy@st.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, maxime.coquelin@st.com, alexandre.torgue@st.com
List-Id: devicetree@vger.kernel.org

On Thursday 30 January 2014, Patrice CHOTARD wrote:
> From: Alexandre TORGUE <alexandre.torgue@st.com>
> 
> This patch adds support to STiD127 SoC.
> The main adaptation is the L2 cache way size compare to STiH41x SoCs.
> 
> Signed-off-by: alexandre torgue <alexandre.torgue@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  arch/arm/mach-sti/board-dt.c |    6 ++++++
>  1 file changed, 6 insertions(+)

Wouldn't it be better to read this value from the l2 cache
controller node? I'd assume there might be more SoCs that
will need a similar change, so it's better to come up with
a solution that doesn't involve changing the kernel every
time.

	Arnd
