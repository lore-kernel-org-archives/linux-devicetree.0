From: Marta Rybczynska <rybczynska@gmail.com>
Subject: Re: [PATCH 00/36] Devicetree schema
Date: Thu, 8 Nov 2018 20:54:36 +0100
Message-ID: <CAApg2=QtTWxi6rhC-r971-HXPP2QEP=ZRRwS7nHQjKRMLGct7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: robh@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <glikely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

Rob,
The patch set does convert the documentation files. Could you explain
the workflow of verifying a DTS? From what I can understand we can
validate YAML devicetrees, and the schema files against the
meta-schemas, but I see no tool for DTS to YAML conversion in your
tools. Do you use https://github.com/pantoniou/yamldt ?

Thanks,
Marta
