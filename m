From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH 2/2] ftpm: firmware TPM running in TEE
Date: Wed, 3 Apr 2019 21:18:27 +0300
Message-ID: <20190403181827.GB17006@linux.intel.com>
References: <20190402193316.15144-1-sashal@kernel.org>
 <20190402193316.15144-2-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190402193316.15144-2-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca, linux-kernel@microsoft.com, bryankel@microsoft.com, thiruan@microsoft.com, suredd@microsoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 02, 2019 at 03:33:16PM -0400, Sasha Levin wrote:
> This patch adds support for a software-only implementation of a TPM
> running in TEE.
> 
> There is extensive documentation of the design here:
> https://www.microsoft.com/en-us/research/publication/ftpm-software-implementation-tpm-chip/ .
> 
> As well as reference code for the firmware available here:
> https://github.com/Microsoft/ms-tpm-20-ref/tree/master/Samples/ARM32-FirmwareTPM
> 
> Signed-off-by: Thirupathaiah Annapureddy <thiruan@microsoft.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

What is the context anyway? I mean tpm_crb already supports fTPM running
in TZ.

/Jarkko
