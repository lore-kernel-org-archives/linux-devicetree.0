From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH 2/2] ftpm: firmware TPM running in TEE
Date: Tue, 2 Apr 2019 13:56:43 -0700
Message-ID: <20190402135643.02443863@shemminger-XPS-13-9360>
References: <20190402193316.15144-1-sashal@kernel.org>
        <20190402193316.15144-2-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402193316.15144-2-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca, Microsoft Linux Kernel List <linux-kernel@microsoft.com>, "Bryan Kelly (CSI)" <bryankel@microsoft.com>, Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sudhakar Evuri <suredd@microsoft.com>, arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2 Apr 2019 12:33:16 -0700
"Sasha Levin" <sashal@kernel.org> wrote:

> +/*
> + * ftpm_tee_tpm_op_recv retrieve fTPM response.
> + * @param: chip, the tpm_chip description as specified in
> driver/char/tpm/tpm.h.
> + * @param: buf,	the buffer to store data.
> + * @param: count, the number of bytes to read.
> + * @return: In case of success the number of bytes received.
> + *	    In other case, a < 0 value describing the issue.
> + */

You are using a docbook style comment but it doesn't start with
docbook prefix.

/**
 * ftpm_tee_tpm_op_recv retrieve fTPM response.
 *
 * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h.
 * @param: buf,	the buffer to store data.
 * @param: count, the number of bytes to read.
 * @return: In case of success the number of bytes received.
 *	    In other case, a < 0 value describing the issue.
 */
