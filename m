From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 0/4] Add reset controllers for STiH407 SoC
Date: Thu, 03 Jul 2014 11:20:48 +0200
Message-ID: <1404379248.18039.31.camel@paszta.hi.pengutronix.de>
References: <1404310129-14667-1-git-send-email-peter.griffin@linaro.org>
 <1404317194.4109.13.camel@paszta.hi.pengutronix.de>
 <20140702165924.GB17665@lee--X1> <53B50EFD.2070007@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53B50EFD.2070007@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: devicetree@vger.kernel.org, srinivas.kandagatla@gmail.com, linux-kernel@vger.kernel.org, patrice.chotard@st.com, Peter Griffin <peter.griffin@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Donnerstag, den 03.07.2014, 10:06 +0200 schrieb Maxime Coquelin:
> I will queue patch 4 to STi DT branch for v3.17.
> For now, no nodes uses reset for STiH407, so we don't need the 
> dt-bindings header file in the STi tree.
> 
> If we have a DT node using a reset line before my pull-request, I might 
> have to integrate the series in the STi DT branch.
> Philipp, does that sound reasonable?

Patch 4 depends on patch 1 for the header. My tree is still empty, how
about I take the first two, and you merge that branch and then take 3
and 4 on top?

    git://git.pengutronix.de/git/pza/linux.git reset/for_v3.17

Lee, shall I also add your Ack to the documentation patch?

regards
Philipp
