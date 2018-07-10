From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 3/6] dt: bindings: add bindings for msa memory region
Date: Tue, 10 Jul 2018 16:44:41 -0700
Message-ID: <20180710234440.GB40352@ban.mtv.corp.google.com>
References: <20180706090043.28363-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180706090043.28363-1-govinds@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org
To: Govind Singh <govinds@codeaurora.org>
Cc: devicetree@vger.kernel.org, niklas.cassel@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 06, 2018 at 02:30:43PM +0530, Govind Singh wrote:
[snip]

You still don't quite have the threading right on this series. All the
other patches seem OK -- they have this in the header, which links them
to the cover letter:

In-Reply-To: <20180706085622.27945-1-govinds@codeaurora.org>
References: <20180706085622.27945-1-govinds@codeaurora.org>

But you seem to have missed that on this one patch for some reason.

Brian
