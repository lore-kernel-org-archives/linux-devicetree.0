From: Loc Ho <lho@apm.com>
Subject: Re: [PATCH v4 1/2] acpi: Fix proper return code for function acpi_gsi_to_irq
Date: Mon, 25 Jan 2016 13:23:44 -0800
Message-ID: <CAPw-ZTnm5F3Kt+_J6HoNCYbx8R7JVkME5yA9V-hAwRtr8ge9ZA@mail.gmail.com>
References: <1453335459-3617-1-git-send-email-lho@apm.com>
	<1453335459-3617-2-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1453335459-3617-2-git-send-email-lho@apm.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Tomasz Nowicki <tomasz.nowicki@linaro.org>, Fu Wei <fu.wei@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, marc.zyngier@arm.com
Cc: linux-edac <linux-edac@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-acpi@vger.kernel.org, "patches@apm.com" <patches@apm.com>, Loc Ho <lho@apm.com>, Tuan Phan <tphan@apm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 20, 2016 at 4:17 PM, Loc Ho <lho@apm.com> wrote:
>
> The function acpi_gsi_to_irq must return 0 on success as the caller
> ghes_probe expects an 0 for success. This change also matches x86
> implementation.
>
> Signed-off-by: Tuan Phan <tphan@apm.com>
> Signed-off-by: Loc Ho <lho@apm.com>


Any issue with this version? If not, can this be pulled into 4.5?

-Loc
