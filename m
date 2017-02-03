From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] devicetree: Add video bus switch
Date: Fri, 3 Feb 2017 14:32:19 +0100
Message-ID: <20170203133219.GD26759@pali>
References: <20161023200355.GA5391@amd>
 <20161119232943.GF13965@valkosipuli.retiisi.org.uk>
 <20161214122451.GB27011@amd>
 <20161222100104.GA30917@amd>
 <20161222133938.GA30259@amd>
 <20161224152031.GA8420@amd>
 <20170203123508.GA10286@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170203123508.GA10286@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, robh+dt@kernel.org, devicetree@vger.kernel.org, ivo.g.dimitrov.75@gmail.com, sre@kernel.org, linux-media@vger.kernel.org, galak@codeaurora.org, mchehab@osg.samsung.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 03 February 2017 13:35:08 Pavel Machek wrote:
> N900 contains front and back camera, with a switch between the
> two. This adds support for the switch component, and it is now
> possible to select between front and back cameras during runtime.

IIRC for controlling cameras on N900 there are two GPIOs. Should not you
have both in switch driver?

-- 
Pali Rohár
pali.rohar@gmail.com
