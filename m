From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/2 RESEND] dt-bindings: bcm283x: Fix
 register ranges of bcm2835-i2s
Date: Mon, 19 Feb 2018 13:35:44 -0600
Message-ID: <20180219193544.eih76l5j7tlde6ul@rob-hp-laptop>
References: <1518778534-3328-1-git-send-email-stefan.wahren@i2se.com>
 <1518778534-3328-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1518778534-3328-2-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Eric Anholt <eric@anholt.net>, Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 16, 2018 at 11:55:33AM +0100, Stefan Wahren wrote:
> Since 517e7a1537a ("ASoC: bcm2835: move to use the clock framework")
> the bcm2835-i2s requires a clock as DT property. Unfortunately
> the necessary DT change has never been applied. While we are at it
> also fix the first PCM register range to cover the PCM_GRAY register.
> 
> This patch only fixes the affected dt-bindings.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> ---
>  Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt   | 4 ++--
>  Documentation/devicetree/bindings/sound/brcm,bcm2835-i2s.txt | 9 ++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org> 
