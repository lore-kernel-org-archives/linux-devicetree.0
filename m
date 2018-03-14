Return-Path: <SRS0=g2yf=GE=secretlab.ca=glikely@kernel.org>
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <3d391844-6f9d-4d20-b95b-5c88afc7c749@xilinx.com>
References: <3d391844-6f9d-4d20-b95b-5c88afc7c749@xilinx.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 14 Mar 2018 14:44:07 +0000
Message-ID: <CACxGe6sC4AKzdGxFCzjKhN5yYpKwPbPOUTxajvs4SQmSwneJyw@mail.gmail.com>
Subject: Re: Automatic EDA output to DTS
Content-Type: text/plain; charset="UTF-8"
To: Michal Simek <michal.simek@xilinx.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Sakis Panou <sakisp@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 14, 2018 at 2:39 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> Hi guys,
>
> Are you aware about any activity or any plan for taking the output of an
> EDA tool such as Protel, Orcad, Cadence Allegro, KiCad, (other) and
> converting it to a full blow DTS(I) file(s) to describe to the board
> device level topology?

I know that Gumstix has a tool that outputs a .dts for a board design.
Mostly they do custom carrier boards for existing modules, so the new
DTS builds on top of the baseboard dts.

I haven't heard of any other projects. Traditional schematic capture
operates at a pretty low level, so it may be difficult to generate
useful .dts files from that. It would be interesting to have a tool
that starts from a block diagram as input to the schematic capture and
that could also output .dts descriptions.

https://www.gumstix.com/geppetto/overview/#design

Cheers,
g.
