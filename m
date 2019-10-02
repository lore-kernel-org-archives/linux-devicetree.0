From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v6 8/9] ima: deprecate permit_directio, instead use
 appraise_flag
Date: Wed, 02 Oct 2019 17:00:12 -0400
Message-ID: <1570050012.4421.50.camel@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
         <1569594360-7141-9-git-send-email-nayna@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569594360-7141-9-git-send-email-nayna@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Matthew Garret <matthew.garret@nebula.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudio Carvalho <cclaudio@linux.ibm.com>, George Wilson <gcwilson@linux.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>, Eric Ricther <erichte@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Nayna,

On Fri, 2019-09-27 at 10:25 -0400, Nayna Jain wrote:
> This patch deprecates the existing permit_directio flag, instead adds
> it as possible value to appraise_flag parameter.
> For eg.
> appraise_flag=permit_directio

Defining a generic "appraise_flag=", which supports different options,
is the right direction.  I would really like to depreciate the
"permit_directio" flag, not just change the policy syntax.  For now,
let's drop this change.

Mimi
