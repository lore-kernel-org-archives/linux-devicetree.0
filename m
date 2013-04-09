From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] clk: si5351: Add gapless tuning for SI5351 PLL
Date: Tue, 9 Apr 2013 11:25:41 +0200
Message-ID: <CABJ1b_RW=UUxmTrYOsx2wsDm1egs9DL3dWtat0--5kqec9-rQA@mail.gmail.com>
References: <1365495975-792-1-git-send-email-michal.bachraty@streamunlimited.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365495975-792-1-git-send-email-michal.bachraty@streamunlimited.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michal Bachraty <michal.bachraty@streamunlimited.com>
Cc: mturquette@linaro.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, rob@landley.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 9, 2013 at 10:26 AM, Michal Bachraty
<michal.bachraty@streamunlimited.com> wrote:
> For gapless tuning, there is no need for PLL reset and clkout power-down
> when tuning output. "silabs,gapless-tuning" parameter enables gapless tuning
> for specific clock output.

Michal,

does gapless tuning have any constraints? Can we use it for all rate
changes or determine the
need for pll reset by rate offset?

Sebastian
