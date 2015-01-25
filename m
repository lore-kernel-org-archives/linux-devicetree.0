From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 31/36] devicetree: document ingenic,jz4780-intc binding
Date: Sun, 25 Jan 2015 19:15:00 +0100
Message-ID: <54C532A4.4090107@metafoo.de>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com> <1421620945-25502-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1421620945-25502-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/18/2015 11:42 PM, Paul Burton wrote:
[...]
> +Ingenic jz4780 SoC Interrupt Controller
> +
> +Required properties:
> +
> +- compatible : should be "ingenic,jz4780-intc"

I don't think we need a second binding specification. Just add the 
compatibility string to the existing jz4740-intc specification.
