From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] scsi: Convert to using %pOF instead of full_name
Date: Mon, 24 Jul 2017 21:50:48 -0400
Message-ID: <yq17eyx2sjr.fsf@oracle.com>
References: <20170718214339.7774-48-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-48-robh@kernel.org> (Rob Herring's message
        of "Tue, 18 Jul 2017 16:43:28 -0500")
Sender: linux-scsi-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-scsi@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Rob,

> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.

Applied to 4.14/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
