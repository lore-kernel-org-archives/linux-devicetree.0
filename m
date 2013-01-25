From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i2c: Add driver for PTN3460 LVDS/DP bridge
Date: Fri, 25 Jan 2013 10:56:52 +0200
Message-ID: <87bocdtzcb.fsf@intel.com>
References: <1359050946-25061-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1359050946-25061-1-git-send-email-seanpaul@chromium.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Sean Paul <seanpaul@chromium.org>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Thu, 24 Jan 2013, Sean Paul <seanpaul@chromium.org> wrote:
> +static int ptn3460_power_up(struct ptn3460_platform_data *pd)
> +{
> +	int ret;
> +
> +	if (pd->gpio_pd_n > 0)
> +		gpio_set_value(pd->gpio_pd_n, 1);

Hi Sean, just a random thing that caught my eye: last I checked 0 is a
valid GPIO number. You can use gpio_is_valid() on the GPIO numbers.


BR,
Jani.
