From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: add STMicroelectronics
 STM32 IPCC binding
Date: Mon, 9 Apr 2018 10:45:06 -0500
Message-ID: <20180409154506.fszkflmyhprd5ztk@rob-hp-laptop>
References: <1523269706-23724-1-git-send-email-fabien.dessenne@st.com>
 <1523269706-23724-2-git-send-email-fabien.dessenne@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523269706-23724-2-git-send-email-fabien.dessenne@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jassi Brar <jassisinghbrar@gmail.com>, Ludovic Barre <ludovic.barre@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 09, 2018 at 12:28:25PM +0200, Fabien Dessenne wrote:
> Add a binding for the STMicroelectronics STM32 IPCC block exposing a
> mailbox mechanism between two processors.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  .../devicetree/bindings/mailbox/stm32-ipcc.txt     | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt

Please add acks/reviewed-bys when posting new versions.

Rob
