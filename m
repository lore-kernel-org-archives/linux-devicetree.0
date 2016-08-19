From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] devicetree: Sort vendor prefixes in alphabetical
 order
Date: Fri, 19 Aug 2016 08:42:55 -0500
Message-ID: <20160819134255.GA29943@rob-hp-laptop>
References: <54da74da3f60ede0bf8fb789ffee584703e81a29.1471553094.git.ccc94453@vip.cybercity.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <54da74da3f60ede0bf8fb789ffee584703e81a29.1471553094.git.ccc94453@vip.cybercity.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 17, 2016 at 11:13:34PM +0200, Rask Ingemann Lambertsen wrote:
> Vendor prefixes should be listed in alphabetical order, which some of
> them weren't, so this patch corrects that.
> 
> Signed-off-by: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
> ---
> 
> I used 'sort --ignore-case --key 1,1'.
> 
> Changes in v3:
> This patch is new in v3.
> 
>  .../devicetree/bindings/vendor-prefixes.txt        | 30 +++++++++++-----------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Oh, there's a lot more than I realized. I'd suggest that I take patches 
1 and 2 thru my tree so I can manage any conflicts.

Rob
