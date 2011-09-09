From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: gpio_keys - Use of_property_read_u32
Date: Fri, 9 Sep 2011 11:10:35 -0700
Message-ID: <20110909181035.GF32383@core.coreip.homeip.net>
References: <1314775945-6822-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1314775945-6822-1-git-send-email-tklauser@distanz.ch>
Sender: linux-input-owner@vger.kernel.org
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Grant Likely <grant.likely@secretlab.ca>, David Jander <david@protonic.nl>, linux-input@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 31, 2011 at 09:32:25AM +0200, Tobias Klauser wrote:
> Use the of_property_read_u32 helper function to retreive u32 values
> from the device tree. Also do not pass the len parameter to
> of_get_property if it isn't checked afterwards.
> 

Applied, thanks Tobias.

-- 
Dmitry
