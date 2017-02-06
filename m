From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Mon, 06 Feb 2017 12:10:18 +0200
Message-ID: <87o9yfbpf9.fsf@intel.com>
References: <20170131160319.9695-1-noralf@tronnes.org> <20170131160319.9695-3-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170131160319.9695-3-noralf@tronnes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 31 Jan 2017, Noralf Trønnes <noralf@tronnes.org> wrote:
> +#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE

BACKLIGHT_CLASS_DEVICE is a tristate, you'll want

#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)

and probably either

	depends on BACKLIGHT_CLASS_DEVICE

or

	depends on BACKLIGHT_CLASS_DEVICE || BACKLIGHT_CLASS_DEVICE=n

in your Kconfig.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center
