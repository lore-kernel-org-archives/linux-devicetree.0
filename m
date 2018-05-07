Return-Path: <robherring2@gmail.com>
Date: Mon, 7 May 2018 15:45:57 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Documentation: dt: edac: Move Altera SOCFPGA EDAC file
Message-ID: <20180507204557.GA18719@rob-hp-laptop>
References: <1525203036-21774-1-git-send-email-thor.thayer@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525203036-21774-1-git-send-email-thor.thayer@linux.intel.com>
To: thor.thayer@linux.intel.com
Cc: bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 01, 2018 at 02:30:36PM -0500, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Move the Altera SOCFPGA EDAC file from bindings/arm/altera to
> bindings/edac.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         | 268 ---------------------
>  .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 268 +++++++++++++++++++++
>  2 files changed, 268 insertions(+), 268 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
>  create mode 100644 Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt

Next time be sure to use the -M option to show moves (or set the git 
config option permanently).

Acked-by: Rob Herring <robh@kernel.org>
