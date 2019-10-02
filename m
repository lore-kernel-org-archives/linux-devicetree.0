From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v6 6/9] ima: make process_buffer_measurement() non static
Date: Wed, 02 Oct 2019 18:04:43 -0400
Message-ID: <1570053883.4421.77.camel@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
         <1569594360-7141-7-git-send-email-nayna@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569594360-7141-7-git-send-email-nayna@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Matthew Garret <matthew.garret@nebula.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudio Carvalho <cclaudio@linux.ibm.com>, George Wilson <gcwilson@linux.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>, Eric Ricther <erichte@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Prakhar Srivastava <prsriva02@gmail.com>
List-Id: devicetree@vger.kernel.org

[Cc'ing Prakhar]

On Fri, 2019-09-27 at 10:25 -0400, Nayna Jain wrote:
> To add the support for checking against blacklist, it would be needed
> to add an additional measurement record that identifies the record
> as blacklisted.
> 
> This patch modifies the process_buffer_measurement() and makes it
> non static to be used by blacklist functionality. It modifies the
> function to handle more than just the KEXEC_CMDLINE.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>

Making process_buffer_measurement() non static is the end result, not
the reason for the change.  The reason for changing
process_buffer_measurement() is to make it more generic.  The
blacklist measurement record is the usecase.

Please rewrite the patch description.

thanks,

Mimi
