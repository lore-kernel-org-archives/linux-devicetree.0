Return-Path: <SRS0=8hLa=PY=bootlin.com=maxime.ripard@kernel.org>
Date: Wed, 16 Jan 2019 15:59:09 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: JSON schema and conditions
Message-ID: <20190116145909.7x6n47a35xsjknj2@flea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

I've started playing a bit with the schemas, and one thing I cannot
wrap my head around at the moment is how to express things like one
property being required only by one compatible over a couple expressed
in the binding document.

Things like a reset property only being required for one particular SoC
for example.

Looking at the current examples, I could see two solutions, one where
we could condition a dependency on a propery value, and the other
where we could inherit another schema and just add more constraints.

I haven't found a way to find either though. Is it covered currently?

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
