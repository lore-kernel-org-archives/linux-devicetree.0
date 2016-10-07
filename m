From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [v7,
 1/3] Documentation: dt: net: add ath9k wireless device binding
Date: Fri,  7 Oct 2016 12:17:43 +0000 (UTC)
Message-ID: <20161007121743.C9B3E61AF7@smtp.codeaurora.org>
References: <20161002214743.2263-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath9k-devel-bounces@lists.ath9k.org>
In-Reply-To: <20161002214743.2263-2-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=unsubscribe>
List-Archive: <http://lists.ath9k.org/pipermail/ath9k-devel>
List-Post: <mailto:ath9k-devel@lists.ath9k.org>
List-Help: <mailto:ath9k-devel-request@lists.ath9k.org?subject=help>
List-Subscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=subscribe>
Sender: ath9k-devel-bounces@lists.ath9k.org
Errors-To: ath9k-devel-bounces@lists.ath9k.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arend.vanspriel@broadcom.com, mcgrof@do-not-panic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, julian.calaby@gmail.com, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, robh+dt@kernel.org, ath9k-devel@lists.ath9k.org, chunkeey@googlemail.com, bjorn@mork.no, nbd@nbd.name
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> Add documentation how devicetree can be used to configure ath9k based
> devices.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Looks good to me but missing the ack from DT maintainers, will wait for
that.

3 patches set to Deferred.

9359805 [v7,1/3] Documentation: dt: net: add ath9k wireless device binding
9359801 [v7,2/3] ath9k: add a helper to get the string representation of ath_bus_type
9359803 [v7,3/3] ath9k: parse the device configuration from an OF node

-- 
https://patchwork.kernel.org/patch/9359805/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
