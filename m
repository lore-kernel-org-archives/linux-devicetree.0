From: Alan Tull <atull@kernel.org>
Subject: Re: [PATCH v10 2/2] fpga: lattice machxo2: Add Lattice MachXO2 support
Date: Thu, 5 Apr 2018 10:12:05 -0500
Message-ID: <CANk1AXTBNubsYm=psFRpL+q5oEckfyjdOfzmr-DOn69XCOCmbw@mail.gmail.com>
References: <1522782152-27300-1-git-send-email-p.pisati@gmail.com> <1522782152-27300-3-git-send-email-p.pisati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522782152-27300-3-git-send-email-p.pisati@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Moritz Fischer <mdf@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-fpga@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 3, 2018 at 2:02 PM, Paolo Pisati <p.pisati@gmail.com> wrote:

Hi Paolo,

Looks good, except that I have to fix up the calls to
fpga_mgr_register/unregister since my API changes didn't go in.  I've
fixed those up and pushed to a branch on my kernel org git repo to let
the robots do some testing.  I'll post (v11 with those fixes) after
that is cleared.

We're too late for 4.17, expect it for 4.18.

Thanks,
Alan

> This patch adds support to the FPGA manager for programming
> MachXO2 device’s internal flash memory, via slave SPI.
>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Acked-by: Alan Tull <atull@kernel.org>
