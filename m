From: srinivas kandagatla <srinivas.kandagatla@st.com>
Subject: Re: [PATCH 1/4] ARM: STi: add stid127 soc support
Date: Fri, 31 Jan 2014 12:27:39 +0000
Message-ID: <52EB96BB.6070800@st.com>
References: <1391093744-19905-1-git-send-email-patrice.chotard@st.com>
 <1391093744-19905-2-git-send-email-patrice.chotard@st.com>
 <201401301935.16463.arnd@arndb.de> <201401301939.08302.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201401301939.08302.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Patrice CHOTARD <patrice.chotard@st.com>, Stuart Menefy <stuart.menefy@st.com>, alexandre.torgue@st.com, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, maxime.coquelin@st.com
List-Id: devicetree@vger.kernel.org

Hi Arnd,
On 30/01/14 18:39, Arnd Bergmann wrote:
> Actually reading the code in this file shows that the L2 cache
> initialization is the only nonstandard thing in there. We should
> really find a way to get rid of the entire function.
I think this will get rid of lot of code left in board-dt.

> 
> Sorry if I missed the initial review, but can you explain
> why this is needed to start with?
On ST SoCs the default value for L2 AUX_CTRL register is 0x0, so we  set
the way-size explicit here.

Thanks,
srini
