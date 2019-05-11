From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: sei510: consistently order nodes
Date: Sat, 11 May 2019 17:52:50 +0200
Message-ID: <3bad9dc8c53e50c4aea1212bf949215660259412.camel@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com>
         <20190510155327.5759-2-jbrunet@baylibre.com> <7h4l62dlyh.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7h4l62dlyh.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-05-10 at 14:43 -0700, Kevin Hilman wrote:
> minor nit: I kind of like "aliases" and "chosen" at the top since they
> are kind of special nodes, but honestly, I can't think of a really good
> reason other than personal preference, so keeping things sorted as
> you've done here is probably better.
> 

You thought the same, then thought maybe memory was important too. But going
down that path, you end up sorting by feeling. It is going to be difficult
to all agree on which nodes are special.

In the end, we just want/need something that is easy to respect and verify.

> Kevin
