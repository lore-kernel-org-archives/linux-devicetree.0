From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv3 9/9] ARM: dts: Add Altera Arria10 L2 Cache EDAC
 devicetree entry
Date: Tue, 29 Mar 2016 16:00:18 +0200
Message-ID: <20160329140018.GD3705@pd.tnic>
References: <1458576106-24505-1-git-send-email-tthayer@opensource.altera.com>
 <1458576106-24505-10-git-send-email-tthayer@opensource.altera.com>
 <20160329084549.GC3705@pd.tnic>
 <CADhT+wfb6DOpBV11zZY-HYMkwnQECu8J3=aM9z39Db+=3u9Wng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADhT+wfb6DOpBV11zZY-HYMkwnQECu8J3=aM9z39Db+=3u9Wng@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Dinh Nguyen <dinh.linux@gmail.com>
Cc: Thor Thayer <tthayer@opensource.altera.com>, dougthompson@xmission.com, m.chehab@samsung.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Dinh Nguyen <dinguyen@opensource.altera.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, linux-edac@vger.kernel.org, Linux List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thor Thayer <tthayer.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 29, 2016 at 07:15:38AM -0500, Dinh Nguyen wrote:
> If you don't mind, I can take this patch. This will prevent merge
> conflicts in the
> DTS board files.

Fine with me as long as people don't start complaining if they start
testing my for-next branch and realize that the Arria10 support is not
complete.

Unless they test linux-next where your tree is too, I assume.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
