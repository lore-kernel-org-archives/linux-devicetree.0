From: Kevin Cernekee <cernekee@chromium.org>
Subject: Re: [PATCH V2 1/4] regmap: cache: Add "was_reset"
	argument to regcache_sync_region()
Date: Fri, 24 Apr 2015 19:44:45 -0700
Message-ID: <CAJzqFtaUAPhSANLa-T+c2jhtDspK3yVeDnyFQrh2-ev0QOGVZA@mail.gmail.com>
References: <1429915008-22015-1-git-send-email-cernekee@chromium.org>
 <1429915008-22015-2-git-send-email-cernekee@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1429915008-22015-2-git-send-email-cernekee@chromium.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Andrew Bresticker <abrestic@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dgreid@chromium.org, Olof Johansson <olofj@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 24, 2015 at 3:36 PM, Kevin Cernekee <cernekee@chromium.org> wrote:
> regcache_sync() and regcache_sync_region() currently assume that the
> hardware has just emerged from a clean reset, and that all registers are
> in their default states.  But that isn't the only possibility; the device
> may have been in a different state in which the registers were
> inaccessible but have retained their contents, e.g. clock gating.
>
> So we will extend the more versatile of the two functions,
> regcache_sync_region(), to let the caller decide what assumptions should
> be made.
>
> One driver that can benefit from this is adau1977, which has hacks to
> overwrite the registers that regcache_sync() might have missed.  Also,
> the powerdown pin on tas571x does not reset the register contents either,
> so a similar feature will be required by that driver.
>
> This commit just adds the new argument by changing the function
> declarations and call sites, but doesn't wire it up yet.

The last two lines of the changelog were inadvertently carried over
from an older version of the patch, and should be deleted.  Will fix
in V3.
