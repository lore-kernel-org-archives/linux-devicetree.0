From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 0/2] ARM: Dove: Add audio to the DT
Date: Wed, 28 Aug 2013 16:48:29 +0200
Message-ID: <20130828164829.14256ce2@skate>
References: <20130828113438.0a77fd54@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130828113438.0a77fd54@armhf>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Dear Jean-Francois Moine,

On Wed, 28 Aug 2013 11:34:38 +0200, Jean-Francois Moine wrote:
> This patch series adds audio DT to the Dove boards and activates the
> Cubox audio device.
> 
> Full audio in the Cubox will work when the DT extension of the generic
> simple audio card will be complete.

What is the status of this generic simple audio card effort? I've seen
the patch you had posted at https://lkml.org/lkml/2013/7/20/128 and the
following discussion. Has anyone picked up the work of Kuninori
Morimoto?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
