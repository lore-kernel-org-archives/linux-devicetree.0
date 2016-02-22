From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] auxdisplay: ht16k33: Driver for LED controller.
Date: Sun, 21 Feb 2016 20:54:50 -0600
Message-ID: <20160222025450.GO15973@rob-hp-laptop>
References: <1455788642-4289-1-git-send-email-robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455788642-4289-1-git-send-email-robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin van der Gracht <robin@protonic.nl>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 10:44:02AM +0100, Robin van der Gracht wrote:
> This is a driver for the Holtek HT16K33 LED controller with keyscan.
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> ---
> Changes in v3:
>  - Renamed device-tree property 'refresh-rate' to 'refresh-rate-hz'
>  - Renamed device-tree property 'default-brightness' to 'default-brightness-level'
>  - Realligned the strings in the documentation (ht16k33.txt).
> 
>  .../devicetree/bindings/display/ht16k33.txt        |  42 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/auxdisplay/Kconfig                         |   9 +
>  drivers/auxdisplay/Makefile                        |   1 +
>  drivers/auxdisplay/ht16k33.c                       | 574 +++++++++++++++++++++
>  4 files changed, 626 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ht16k33.txt
>  create mode 100644 drivers/auxdisplay/ht16k33.c
