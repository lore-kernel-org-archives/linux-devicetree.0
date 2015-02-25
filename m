From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] New of_io_release_and_unmap()
Date: Wed, 25 Feb 2015 20:23:21 +0100
Message-ID: <7444779.882rMgOx5D@wuerfel>
References: <cover.1424889345.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1424889345.git.stillcompiling@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Clayton <stillcompiling@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 25 February 2015 11:20:41 Joshua Clayton wrote:
> Hello folks,
> I notice that io_request_and_map has no inverse.
> I would like to add a new function to undo what it does.
> 

What do you want to use this for? So far all users are in essential drivers
(clk and clocksource) that result in a boot failure if this goes wrong.

Normal drivers can probably always use devm_ioremap_resource(), which
has an automatic cleanup.

	Arnd
