From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 2/6] uio: Add new UIO_MEM_PHYS_CACHE type for mem
 regions
Date: Fri, 31 Oct 2014 09:35:57 +0000
Message-ID: <20141031093557.GT27405@n2100.arm.linux.org.uk>
References: <1413871011-4101-1-git-send-email-ankit.jindal@linaro.org>
 <1413871011-4101-3-git-send-email-ankit.jindal@linaro.org>
 <6D33D50E-2DD1-482C-B05E-45B237F3B779@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6D33D50E-2DD1-482C-B05E-45B237F3B779@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Ankit Jindal <ankit.jindal@linaro.org>, linux-kernel@vger.kernel.org, "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@apm.com, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Tushar Jagad <tushar.jagad@linaro.org>, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Varka Bhadram <varkabhadram@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 21, 2014 at 08:38:23AM +0200, Kumar Gala wrote:
> Rather than adding a new type, why not allow the driver to set the

Please wrap your message.

That doesn't work.  A pgprot_t contains more than just memory type
information.  It also contains access permissions.  In other words,
if the user requested read-only or a read-write mapping, the
permissions will be different.

If you always use your stored pgprot_t, then you will override the
users requested permissions.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
