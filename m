From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 2/7] ARM: bcm2835: Add a Raspberry Pi-specific clock
 driver.
Date: Tue, 19 May 2015 06:05:44 +0300
Message-ID: <20150519030544.GQ2845@tarshish>
References: <1431978219-14226-1-git-send-email-eric@anholt.net>
 <1431978219-14226-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431978219-14226-3-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

On Mon, May 18, 2015 at 12:43:34PM -0700, Eric Anholt wrote:
> +DEFINE_MUTEX(delayed_clock_init);

Static?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
