From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v4] NFC: trf7970a: Correct register settings for 27MHz
 clock
Date: Wed, 28 Jun 2017 09:23:38 +0200
Message-ID: <20170628071746.GL21214@zurbaran.ger.intel.com>
References: <1493328526-28395-1-git-send-email-geoff@kuvee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493328526-28395-1-git-send-email-geoff@kuvee.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geoff Lansberry <geoff@kuvee.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, devicetree@vger.kernel.org, mgreer@animalcreek.com, colin.king@canonical.com, justin@kuvee.com
List-Id: devicetree@vger.kernel.org

Hi Geoff,

On Thu, Apr 27, 2017 at 05:28:46PM -0400, Geoff Lansberry wrote:
> In prior commits the selected clock frequency does not propagate
> correctly to what is written to the TRF7970A_MODULATOR_SYS_CLK_CTRL
> register.
> 
> Signed-off-by: Geoff Lansberry <geoff@kuvee.com>
> ---
>  drivers/nfc/trf7970a.c | 7 +++++++
>  1 file changed, 7 insertions(+)
Applied to nfc-next, thanks.

Cheers,
Samuel.
